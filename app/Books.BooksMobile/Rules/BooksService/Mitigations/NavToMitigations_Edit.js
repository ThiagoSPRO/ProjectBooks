export default function NavToEdit(clientAPI) {
    if (clientAPI.getODataProvider('/BooksMobile/Services/BooksService.service').isDraftEnabled('Mitigations')) {
        return clientAPI.executeAction({
            'Name': '/BooksMobile/Actions/DraftEditEntity.action',
            'Properties': {
                'Target': {
                    'EntitySet': 'Mitigations'
                },
                'OnSuccess': '/BooksMobile/Actions/BooksService/Mitigations/NavToMitigations_Edit.action'
            }
        });
    } else {
        return clientAPI.executeAction('/BooksMobile/Actions/BooksService/Mitigations/NavToMitigations_Edit.action');
    }
}