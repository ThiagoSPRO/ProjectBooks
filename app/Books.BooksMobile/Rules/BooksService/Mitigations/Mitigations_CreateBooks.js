export default function CreateRelatedEntity(clientAPI) {
    if (clientAPI.getODataProvider('/BooksMobile/Services/BooksService.service').isDraftEnabled('Mitigations')) {
        let readLink = clientAPI.binding['@odata.readLink'];
        return clientAPI.executeAction({
            'Name': '/BooksMobile/Actions/BooksService/Mitigations/Mitigations_CreateBooks.action',
            'Properties': {
                'OnSuccess': ''
            }
        }).then((result) => {
            return clientAPI.executeAction({
                'Name': '/BooksMobile/Actions/DraftSaveEntity.action',
                'Properties': {
                    'Target': {
                        'EntitySet': 'Mitigations',
                        'ReadLink': readLink
                    }
                }
            });
        });
    } else {
        return clientAPI.executeAction('/BooksMobile/Actions/BooksService/Mitigations/Mitigations_CreateBooks.action');
    }
}