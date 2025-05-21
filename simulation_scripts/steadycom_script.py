import os
from reframed import load_cbmodel, Community, Environment, SteadyCom, SteadyComVA

# === Configuration ===
base_path = "/home/arog/models/xml"
biomass_rxn_id = "R_BIOMASS_Ec_iJO1366_core_53p95M" 
biomass_rxn_id_iYL1228 = "R_BIOMASS_" # diferentes id de biomassa comparado com os outros modelos
biomass_rxn_id_iCN900 = "R_BIOMASS__5"
num_iterations = 7

# Define external medium
minimal_medium = [
    'R_EX_M_s_e', 'R_EX_M_o2_e', 'R_EX_M_ppi_e', 
    'R_EX_M_fe2_e', 'R_EX_M_nh4_e', 'R_EX_M__e'
]
carbon_source = ['R_EX_co2_e']
carbon_flux = -0.421

# === Step 1: Load models ===
def find_biomass_reaction(model, file_name):
    # Prioritize manual overrides
    if "iYL1228" in file_name:
        candidate = biomass_rxn_id_iYL1228
    elif "iCN900" in file_name:
        candidate = biomass_rxn_id_iCN900
    else:
        candidate = biomass_rxn_id

    # Check if candidate exists
    if candidate in model.reactions:
        return candidate

    raise RuntimeError(f"Biomass reaction not found in model: {file_name}")

def load_models_from_folder(folder_path):
    models = []
    for file in os.listdir(folder_path):
        if file.endswith(".xml"):
            full_path = os.path.join(folder_path, file)
            model = load_cbmodel(full_path)

            # Assign biomass reaction safely
            biomass_rid = find_biomass_reaction(model, file)
            model.biomass_reaction = biomass_rid

            # Close all exchanges initially
            for r_id, rxn in model.reactions.items():
                if r_id.startswith('R_EX_'):
                    rxn.lb = 0

            models.append(model)
            print(f"Loaded model: {file}")

    return models

# === Step 2: Define constraints ===
def initialize_constraints(minimal, carbon):
    constraints = {}
    for rxn_id in minimal:
        constraints[rxn_id] = (-1000, 0)
    for rxn_id in carbon:
        constraints[rxn_id] = (carbon_flux, 0)
    return constraints

def update_constraints_from_exchange_map(exchange_map, constraints, minimal, carbon):
    for (_, met_id), _ in exchange_map.items():
        rxn_id = 'R_EX_' + met_id
        constraints[rxn_id] = (0, 1000)
    for rxn in minimal:
        constraints[rxn] = (-1000, 0)
    for rxn in carbon:
        constraints[rxn] = (carbon_flux, 0)
    return constraints

# === Step 3: Run iterative SteadyCom ===
def run_steadycom_iterations(community, constraints, iterations=7):
    solutions = []
    for i in range(iterations):
        print(f"\n--- Running SteadyCom Iteration {i+1} ---")
        sol = SteadyCom(community, constraints=constraints)
        print(sol)
        solutions.append(sol)
        constraints = update_constraints_from_exchange_map(sol.exchange_map, constraints, minimal_medium, carbon_source)
    return solutions, constraints

# === Main Pipeline ===
if __name__ == "__main__":
    print("Loading models...")
    list_models = load_models_from_folder(base_path)

    print("\nCreating community...")
    community = Community('HumanGut13', models=list_models)

    merged_model = community.merge_models()

    Environment.empty(merged_model, inplace=True)

    print("\nInitializing constraints...")
    constraints = initialize_constraints(minimal_medium, carbon_source)

    print("\nRunning iterative SteadyCom simulations...")
    solutions, final_constraints = run_steadycom_iterations(community, constraints, iterations=num_iterations)

    print("\nFinal SteadyCom Solution:")
    final_sol = solutions[-1]
    for model_id in community.organisms:
        print(f"\nFluxes for {model_id}:")
        print(final_sol.print_internal_fluxes(model_id))

    print("\nRunning SteadyCom FVA...")
    fva = SteadyComVA(community, obj_frac=0.8, constraints=final_constraints)
    print(fva)

