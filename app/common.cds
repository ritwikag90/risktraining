using { riskmanagement as rm } from '../db/schema';

annotate rm.Risks with {

    ID @title : 'Risk ID';
    title @title : 'Title';
    owner @title : 'Owner';
    prio_code @title : 'Priority Code';
    descr @title : 'Description';
    miti @title : 'Mitigation';
    impact @title : 'Impact';
    criticality @title : 'Criticality';
};

annotate rm.Mitigations with {
    ID @(
        UI.Hidden,
        Common : {Text : 'Descr',}
    );
    owner @title : 'Owner';
    descr @title : 'Description';
};

annotate rm.Risks with {

    miti @(Common :{

        Text : miti.descr,
        TextArrangement : #TextOnly,
        ValueList : {
            Label : 'Mitigations',
            CollectionPath : 'Mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'miti_ID',
                    ValueListProperty : 'ID'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr'
                }
            ]
        },

    }

    )
};

