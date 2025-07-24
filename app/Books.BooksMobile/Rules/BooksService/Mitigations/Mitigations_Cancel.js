export default function Cancel(clientAPI) {
    if (clientAPI.getODataProvider('/BooksMobile/Services/BooksService.service').isDraftEnabled('Mitigations')) {
        return clientAPI.executeAction({
            'Name': '/BooksMobile/Actions/DraftDiscardEntity.action',
            'Properties': {
                'Target': {
                    'EntitySet': 'Mitigations'
                },
                'OnSuccess': '/BooksMobile/Actions/CloseModalPage_Cancel.action'
            }
        });
    } else {
        return clientAPI.executeAction('/BooksMobile/Actions/CloseModalPage_Cancel.action');
    }
}