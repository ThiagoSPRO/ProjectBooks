using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using { Books as my } from '../db/schema.cds';

@path : '/service/BooksService'
service BooksService
{
    annotate Books with @restrict :
    [
        { grant : [ '*' ], to : [ 'BookManager' ] },
        { grant : [ 'READ' ], to : [ 'BookViewer' ] }
    ];

    annotate Mitigations with @restrict :
    [
        { grant : [ '*' ], to : [ 'BookManager' ] },
        { grant : [ 'READ' ], to : [ 'BookViewer' ] }
    ];

    @odata.draft.enabled
    entity Books as
        projection on my.Books;

    @odata.draft.enabled
    entity Mitigations as
        projection on my.Mitigations;

    entity A_BusinessPartner as
        projection on BusinessPartnerA2X.A_BusinessPartner
        {
            BusinessPartner,
            Customer,
            Supplier,
            BusinessPartnerCategory,
            BusinessPartnerFullName,
            BusinessPartnerIsBlocked
        };
}

annotate BooksService with @requires :
[
    'authenticated-user',
    'BookViewer',
    'BookManager'
];
