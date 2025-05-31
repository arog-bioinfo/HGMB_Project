import os
from reframed import load_cbmodel
from reframed import Community, Environment
from reframed import SteadyCom, SteadyComVA

basePath = "/home/arog/models/xml"

constraints = {}
list_models = []

for file in os.listdir(basePath):
    if file.endswith(".xml"):
        SBML_FILE = (os.path.join(basePath, file))
        Id = file
        print(Id)
        model = load_cbmodel(SBML_FILE, flavor="bigg")
        if Id == "iCN900.xml":
            model.biomass_reaction = "R_BIOMASS__5"
        elif Id == "iYL1228.xml":
            model.biomass_reaction = "R_BIOMASS_"
        else:
            model.biomass_reaction = "R_BIOMASS_Ec_iJO1366_core_53p95M"

        for r_id, rxn in model.reactions.items():
            if r_id.startswith('R_EX_'):
                if rxn.lb != 0:
                    print(r_id, rxn.lb)
                #rxn.lb = 0
                    constraints[r_id] = (rxn.lb,rxn.ub)

        list_models.append(model)

print(constraints)

community = Community('Gut_comm', models = list_models)

#Environment.empty(merged, inplace = True)
#
#print(merged.metabolites.items())


#for i in minimal_medium:
#    constraints.update ({i:(-1000,0)})

#carbon_source = ["R_EX_glc__D_e"]

#for i in carbon_source:
#    constraints.update({i:(-1000,0)})


#for i in no2_pool:
#    constraints.update({i:(0,0)})

#for i in community.reaction_map:
#    print(i[1])

print(constraints)

print('===============================================')
print('=== SteadyComm ===')

steady_sol = SteadyCom(community)

print(steady_sol)
print(steady_sol.exchange_map)


steady_solFVA = SteadyComVA(community, obj_frac=0.8, constraints=constraints)
print('===============================================')
print('=== SteadyCommFVA ===')
print(steady_solFVA)