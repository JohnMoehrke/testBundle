
### Showing various kinds of Bundles

Note that in Batch and Transaction bundles the resources must be referenced by uuid, and the fullUrl must be a uuid. In Collection bundles, the fullUrl can be anything, and the resources can be referenced by either uuid or by their actual url.  

For human readability, I use uuids that have a pattern that is easy for humans to ignore. `aaaaaaaa-bbbb-cccc-dddd-e00000000???` where the last 3 digits are a sequential number. This makes it easy to ignore the uuids when reading the content, but also makes it easy to identify which resource is being referenced when looking at the fullUrl and the resource reference.

#### Sushi improvement request

Would be nice if Sushi could handle the uuid generation and referencing for us, so that we don't have to worry about it. See

- https://github.com/FHIR/sushi/issues/1079
- https://github.com/FHIR/sushi/issues/783

But that would mean that sushi would need to not replace id values that should not be replaced.

```fsh
Instance:   ex-Bundle-mixed
InstanceOf: Bundle
Title:      "ex-dummy unprofiled Bundle"
Description: """
Bundle with some content. This throws warnings. Given that the fullurl is considered more important than the id, this should work.
"""
Usage: #example
* type = #transaction
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#DELAU
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R
* timestamp = 2020-11-24T23:50:50-05:00
* entry[+].resource = ex-Patient
* entry[=].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003"
* entry[=].request.url = "Patient"
* entry[=].request.method = #POST
* entry[+].resource = ex-ListX
* entry[=].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000002"
* entry[=].request.url = "List"
* entry[=].request.method = #POST
* entry[+].resource = ex-DocumentReferenceX
* entry[=].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000001"
* entry[=].request.url = "DocumentReference"
* entry[=].request.method = #POST
```

gives a set warning like:

> Entry 0 matches the reference Patient/ex-Patient by type and id but its fullUrl urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003 does not match the full target URL urn:uuid:ex-Patient by Bundle resolution rules

### Use of Bundle obligations

The examples here also are showing the concept of putting security tags at the Bundle Level. Specifically marking the Bundle as "Restricted" and "Delete After Use'.

```fsh
Usage: #example
* type = #transaction
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#DELAU
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R
* timestamp = 2020-11-24T23:50:50-05:00
```

The Restricted tag indicates that the most sensitive data in the Bundle is Restricted, vs Normal. 

The Delete After Use tag indicates that the Bundle and contents should be deleted after use. These kind of Obligations and Refrains are useful when the recipient is known to be able to handle them, but they are not widely used in the wild. 

### Original reason for the IG

**First recognized as fixed in December 2021**

**Fixed, confirmed with IG Builder 126, July 2022**


This creates profiles that are profiled into a bundle.

bug - https://github.com/HL7/fhir-ig-publisher/issues/357

