using BooksService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio',
                Value : prio,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'a_BusinessPartner_BusinessPartner',
                Value : a_BusinessPartner_BusinessPartner,
            },
            {
                $Type : 'UI.DataField',
                Value : mitig_ID,
                Label : 'mitig_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : a_BusinessPartner.BusinessPartnerFullName,
                Label : 'BusinessPartnerFullName',
            },
            {
                $Type : 'UI.DataField',
                Value : a_BusinessPartner.BusinessPartnerIsBlocked,
                Label : 'BusinessPartnerIsBlocked',
            },
            {
                $Type : 'UI.DataField',
                Value : a_BusinessPartner.Supplier,
                Label : 'Supplier',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'prio',
            Value : prio,
        },
        {
            $Type : 'UI.DataField',
            Label : 'descr',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'impact',
            Value : impact,
        },
        {
            $Type : 'UI.DataField',
            Label : 'criticality',
            Value : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : a_BusinessPartner.Supplier,
            Label : 'Supplier',
        },
    ],
);

annotate service.Books with {
    mitig @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : mitig_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'createdAt',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'createdBy',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
        ],
    }
};

annotate service.Books with {
    a_BusinessPartner @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'A_BusinessPartner',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : a_BusinessPartner_BusinessPartner,
                ValueListProperty : 'BusinessPartner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Customer',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Supplier',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'BusinessPartnerCategory',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'BusinessPartnerFullName',
            },
        ],
    }
};

annotate service.A_BusinessPartner with {
    Supplier @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'A_BusinessPartner',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Supplier,
                    ValueListProperty : 'BusinessPartner',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Customer',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Supplier',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'BusinessPartnerCategory',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'BusinessPartnerFullName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'BusinessPartnerIsBlocked',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

