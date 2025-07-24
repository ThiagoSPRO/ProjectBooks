export default function UpdateEntity(clientAPI) {
    if (clientAPI.getODataProvider('/BooksMobile/Services/BooksService.service').isDraftEnabled('Books')) {
        return clientAPI.executeAction({
            'Name': '/BooksMobile/Actions/BooksService/Books/Books_UpdateEntity.action',
            'Properties': {
                'OnSuccess': ''
            }
        }).then((result) => {
            return clientAPI.executeAction({
                'Name': '/BooksMobile/Actions/DraftSaveEntity.action',
                'Properties': {
                    'Target': {
                        'EntitySet': 'Books'
                    }
                }
            });
        });
    } else {
        return clientAPI.executeAction('/BooksMobile/Actions/BooksService/Books/Books_UpdateEntity.action');
    }
}