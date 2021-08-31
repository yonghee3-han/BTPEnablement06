using { sap.ui.riskmanagement as my } from '../db/schema';
@path: 'service/risk'
service RiskService {
 
  entity Risks @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer06' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskViewer06' ]
            }
        ]) as projection on my.Risks;
//### END OF INSERT
    annotate Risks with @odata.draft.enabled;
 
//### BEGIN OF INSERT
  entity Mitigations @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer06' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskViewer06' ]
            }
        ]) as projection on my.Mitigations;
//### END OF INSERT
    annotate Mitigations with @odata.draft.enabled;
 
 view testvw as
 select A.impact, B.owner
 from my.Risks as A
 inner join my.Mitigations as B
 on A.miti_id = B.ID
 ;
 
//  entity BusinessPartners as projection on my.BusinessPartners;
}