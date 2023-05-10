{
  "resourceType" : "Bundle",
  "meta" : {
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
      "code" : "DELAU"
    },
    {
      "system" : "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
      "code" : "R"
    }]
  },
  "type" : "searchset",
... other headers etc.....
  "entry" : [
     ... other entries ....
     {
       "resource": {
         "resourceType" : "DocumentReference",
         "id" : "1",
         "meta" : {
            "security" : [{
            "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
            "code" : "ETHUD"
            },
            {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
            "code" : "R"
            }]
        },

         ... other content etc.....
       }
     },
     ... other entries ....     

  ]
}