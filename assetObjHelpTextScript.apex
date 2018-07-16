//object types to search on
String[] types = new String[]{'Asset'};
List<Schema.DescribeSobjectResult> results = Schema.describeSObjects(types);

for (Schema.DescribeSobjectResult result : results) {
  Map<String, Schema.SObjectField> fieldMap = result.fields.getMap();
  Set<String> fieldNames = fieldMap.keySet();
  //System.debug('sObject TYPE: ' + result.getName());
  for(String fieldName : fieldNames) {
    // determine if field is custom
    Boolean isCustom = fieldName.endsWith('__c');
    Boolean hasHelpText = fieldMap.get(fieldName).getDescribe().getInlineHelpText() != null;
    if(isCustom && hasHelpText == false) {
      System.debug('NO HELP TEXT (__c): \n' + 'API name --  ' + fieldMap.get(fieldName).getDescribe().getName() + '\n label -- ' + fieldMap.get(fieldName).getDescribe().getLabel() + '\n \n');
  	} else {
      System.debug('NO HELP TEXT (standard): \n' + 'API name --  ' + fieldMap.get(fieldName).getDescribe().getName() + '\n label -- ' + fieldMap.get(fieldName).getDescribe().getLabel() + '\n \n');
    }
  }
}
