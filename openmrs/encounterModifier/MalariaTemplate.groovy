import org.apache.commons.lang3.time.DateUtils
import org.bahmni.module.bahmnicore.contract.encounter.data.EncounterModifierData
import org.bahmni.module.bahmnicore.encounterModifier.EncounterModifier
import org.bahmni.module.bahmnicore.encounterModifier.exception.CannotModifyEncounterException
import org.bahmni.module.bahmnicore.service.impl.BahmniBridge
import org.codehaus.jackson.map.ObjectMapper
import org.openmrs.Drug
import org.openmrs.api.context.Context
import org.openmrs.module.emrapi.encounter.domain.EncounterTransaction

class MalariaTemplate extends EncounterModifier {

    public static final String WEIGHT_CONCEPT_NAME = "Weight";
    private static final ObjectMapper objectMapper = new ObjectMapper();
    private static final String CHLOROQUINE = "Chloroquine";
    private static final String PARACETAMOL="Paracetamol";
    private static final String SYRUP_FORM = "Syrup"

    public BahmniBridge bahmniBridge;

    @Override
    EncounterModifierData run(EncounterModifierData encounterModifierData) throws CannotModifyEncounterException {

        this.bahmniBridge = BahmniBridge
                .create()
                .forPatient(encounterModifierData.getPatientUuid());

        def weight = fetchLatestValueNumeric(WEIGHT_CONCEPT_NAME);
        if(weight == null || weight <= 0){
            throw new RuntimeException("Patient Weight is not Available");
        }

        List<EncounterTransaction.DrugOrder> drugOrders = encounterModifierData.getDrugOrders();

        switch (weight){
            case 3.0..5.5:
                drugOrders.add(drugOrder(CHLOROQUINE,0.5,DOSAGE.TEASPOON,null,DOSAGE_FREQUENCY.TWICE_A_DAY,1,QUANTITY_UNITS.UNITS,1,DURATION_UNITS.DAYS,"First dose immediately, second dose after 6 hours"));

                EncounterTransaction.DrugOrder order = drugOrder(CHLOROQUINE,0.5,DOSAGE.TEASPOON,null,DOSAGE_FREQUENCY.ONCE_A_DAY,1,QUANTITY_UNITS.UNITS,2,DURATION_UNITS.DAYS,null);
                order.setEffectiveStartDate(DateUtils.addDays(new Date(), 1));
                drugOrders.add(order);

                drugOrders.add(drugOrder(PARACETAMOL,0.5,DOSAGE.TEASPOON,null,DOSAGE_FREQUENCY.THRICE_A_DAY,1.5,QUANTITY_UNITS.UNITS,3,DURATION_UNITS.DAYS,null));

                break;
            case 5.6..12.0:
                drugOrders.add(drugOrder(CHLOROQUINE,2,DOSAGE.TEASPOON,null,DOSAGE_FREQUENCY.TWICE_A_DAY,3,QUANTITY_UNITS.UNITS,1,DURATION_UNITS.DAYS,"First dose 2 Teaspoons immediately, second dose 1 Teaspoon after 6 hours"));

                EncounterTransaction.DrugOrder order = drugOrder(CHLOROQUINE,1,DOSAGE.TEASPOON,null,DOSAGE_FREQUENCY.ONCE_A_DAY,2,QUANTITY_UNITS.UNITS,2,DURATION_UNITS.DAYS,null);
                order.setEffectiveStartDate(DateUtils.addDays(new Date(), 1));
                drugOrders.add(order);

                drugOrders.add(drugOrder(PARACETAMOL,1,DOSAGE.TEASPOON,null,DOSAGE_FREQUENCY.THRICE_A_DAY,9,QUANTITY_UNITS.UNITS,3,DURATION_UNITS.DAYS,null));
                break;
            case 12.1..15.5:
                drugOrders.add(drugOrder(CHLOROQUINE,1,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.TWICE_A_DAY,1.5,QUANTITY_UNITS.UNITS,1,DURATION_UNITS.DAYS,"First dose 1 Tablet immediately, second dose 1/2 Tablet after 6 hours"));

                EncounterTransaction.DrugOrder drugOrder = drugOrder(CHLOROQUINE,0.5,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.ONCE_A_DAY,1,QUANTITY_UNITS.UNITS,2,DURATION_UNITS.DAYS,null);
                drugOrder.setEffectiveStartDate(DateUtils.addDays(new Date(), 1));
                drugOrders.add(drugOrder);

                drugOrders.add(drugOrder(PARACETAMOL,0.5,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.THRICE_A_DAY,6,QUANTITY_UNITS.UNITS,3,DURATION_UNITS.DAYS,null));
                break;
            case 15.6..25.5:
                drugOrders.add(drugOrder(CHLOROQUINE,2,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.TWICE_A_DAY,3,QUANTITY_UNITS.UNITS,1,DURATION_UNITS.DAYS,"First dose 2 Tablets immediately, second dose 1 Tablet after 6 hours"));

                EncounterTransaction.DrugOrder drugOrder = drugOrder(CHLOROQUINE,1,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.ONCE_A_DAY,2,QUANTITY_UNITS.UNITS,2,DURATION_UNITS.DAYS,null);
                drugOrder.setEffectiveStartDate(DateUtils.addDays(new Date(), 1));
                drugOrders.add(drugOrder);

                drugOrders.add(drugOrder(PARACETAMOL,0.5,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.THRICE_A_DAY,6,QUANTITY_UNITS.UNITS,3,DURATION_UNITS.DAYS,null));
                break;
            case 25.6..32.5:
                drugOrders.add(drugOrder(CHLOROQUINE,3,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.TWICE_A_DAY,4.5,QUANTITY_UNITS.UNITS,1,DURATION_UNITS.DAYS,"First dose 3 Tablets immediately, second dose 1.5 Tablet after 6 hours"));

                EncounterTransaction.DrugOrder drugOrder = drugOrder(CHLOROQUINE,1.5,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.ONCE_A_DAY,3,QUANTITY_UNITS.UNITS,2,DURATION_UNITS.DAYS,null);
                drugOrder.setEffectiveStartDate(DateUtils.addDays(new Date(), 1));
                drugOrders.add(drugOrder);

                drugOrders.add(drugOrder(PARACETAMOL,1,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.THRICE_A_DAY,9,QUANTITY_UNITS.UNITS,3,DURATION_UNITS.DAYS,null));
                break;
            default:
                drugOrders.add(drugOrder(CHLOROQUINE,4,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.TWICE_A_DAY,6,QUANTITY_UNITS.UNITS,1,DURATION_UNITS.DAYS,"First dose 4 Tablets immediately, second dose 2 Tablet after 6 hours"));

                EncounterTransaction.DrugOrder do2 = drugOrder(CHLOROQUINE,2,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.ONCE_A_DAY,4,QUANTITY_UNITS.UNITS,2,DURATION_UNITS.DAYS,null);
                do2.setEffectiveStartDate(DateUtils.addDays(new Date(), 1));
                drugOrders.add(do2);
                drugOrders.add(drugOrder(PARACETAMOL,1,DOSAGE.TABLETS,null,DOSAGE_FREQUENCY.THRICE_A_DAY,9,QUANTITY_UNITS.UNITS,3,DURATION_UNITS.DAYS,"something"));

                println("Hello World8");
        }

        encounterModifierData.setDrugOrders(drugOrders)
        return encounterModifierData
    }


    private static EncounterTransaction.DrugOrder createDrugOrder(String drugName, String route) {
        return drugOrder(drugName, null, null, route, null, null, null, null, null, null);
    }

    private static EncounterTransaction.DrugOrder drugOrder(String drugName, Double dose, String doseUnits,
                                                            String route, String frequency, Double quantity,String quantityUnit,
                                                            Integer duration, String durationUnits, String additionalInstructions) {
        def drugOrder = createDrugOrder(drugName, form(drugName), doseUnits, route, frequency, quantity, quantityUnit, duration, durationUnits)
        drugOrder.dosingInstructions.dose = dose;
        if (additionalInstructions != null) {
            def instructions = ["additionalInstructions": additionalInstructions]
            def administrationInstructions = convertToJSON(instructions);
            drugOrder.dosingInstructions.setAdministrationInstructions(administrationInstructions);
        }
        return drugOrder;
    }
    static String form(String name) {
        Drug drug = Context.getConceptService().getDrug(name)
        if (drug == null) throw new NullPointerException("Drug with name: $name doesn't exist")
        return drug.getDosageForm().getName().getName()
    }

    private static String convertToJSON(LinkedHashMap<String, Double> doses) {
        objectMapper.writeValueAsString(doses)
    }

    private static EncounterTransaction.DrugOrder createDrugOrder(String drugName, String drugForm, String doseUnits, String route, String frequency,
                                                                  Double quantity, String quantityUnit, Integer duration, String durationUnits) {
        EncounterTransaction.DrugOrder drugOrder = new EncounterTransaction.DrugOrder();
        EncounterTransaction.Drug drug = new EncounterTransaction.Drug();
        drug.setName(drugName);
        drug.setForm(drugForm);
        drugOrder.setDrug(drug);
        drugOrder.setCareSetting("Outpatient");
        drugOrder.setOrderType("Drug Order");
        drugOrder.setDosingInstructionType("org.openmrs.module.bahmniemrapi.drugorder.dosinginstructions.FlexibleDosingInstructions");

        EncounterTransaction.DosingInstructions dosingInstructions = new EncounterTransaction.DosingInstructions();
        dosingInstructions.setDoseUnits(doseUnits);
        dosingInstructions.setRoute(route);
        dosingInstructions.setFrequency(frequency);
        if (quantity != null)
            dosingInstructions.setQuantity(quantity);
        dosingInstructions.setQuantityUnits(quantityUnit);
        drugOrder.setDosingInstructions(dosingInstructions);

        if (quantity != null)
            drugOrder.setDuration(duration);
        drugOrder.setDurationUnits(durationUnits);

        return drugOrder;
    }


    Double fetchLatestValueNumeric(String conceptName) {
        def obs = bahmniBridge.latestObs(conceptName)
        return obs ? obs.getValueNumeric() : null
    }

    static class DOSAGE {
        public static String TABLETS = "Tablet(s)"
        public static String IU = "IU"
        public static String TEASPOON = "Teaspoon"
    }

    static class DOSAGE_FREQUENCY {
        public static String ONCE_A_DAY = "Once a day"
        public static String TWICE_A_DAY = "Twice a day"
        public static String THRICE_A_DAY = "Thrice a day"
    }

    static class QUANTITY_UNITS{
        public static String UNITS = "Unit(s)";
    }

    static class DURATION_UNITS{
        public static String DAYS="Day(s)";
        public static String WEEKS="Week(s)";
        public static String MONTHS="Month(s)";

    }
}