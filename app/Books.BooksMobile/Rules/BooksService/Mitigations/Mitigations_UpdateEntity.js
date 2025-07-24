export default function UpdateEntity(clientAPI) {
    if (clientAPI.getODataProvider('/BooksMobile/Services/BooksService.service').isDraftEnabled('Mitigations')) {
        return clientAPI.executeAction({
            'Name': '/BooksMobile/Actions/BooksService/Mitigations/Mitigations_UpdateEntity.action',
            'Properties': {
                'OnSuccess': ''
            }
        }).then((result) => {
            return clientAPI.executeAction({
                'Name': '/BooksMobile/Actions/DraftSaveEntity.action',
                'Properties': {
                    'Target': {
                        'EntitySet': 'Mitigations'
                    }
                }
            });
        });
    } else {
        return clientAPI.executeAction('/BooksMobile/Actions/BooksService/Mitigations/Mitigations_UpdateEntity.action');
    }
}