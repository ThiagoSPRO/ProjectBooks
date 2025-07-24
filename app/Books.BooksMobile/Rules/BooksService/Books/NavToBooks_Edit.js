export default function NavToEdit(clientAPI) {
    if (clientAPI.getODataProvider('/BooksMobile/Services/BooksService.service').isDraftEnabled('Books')) {
        return clientAPI.executeAction({
            'Name': '/BooksMobile/Actions/DraftEditEntity.action',
            'Properties': {
                'Target': {
                    'EntitySet': 'Books'
                },
                'OnSuccess': '/BooksMobile/Actions/BooksService/Books/NavToBooks_Edit.action'
            }
        });
    } else {
        return clientAPI.executeAction('/BooksMobile/Actions/BooksService/Books/NavToBooks_Edit.action');
    }
}