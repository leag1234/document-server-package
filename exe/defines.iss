; -- ElixirOffice Defines --

#define sCompanyName        'ElixirOffice'
#define sIntCompanyName     'ElixirOffice'
#define sProductName        'Document Server'
#define sIntProductName     'DocumentServer'
#define sPublisherName      'Ascensio System SIA'
#define sAppCopyright       'Copyright (C) ' + GetDateTimeString('yyyy',,) + ' ' + sPublisherName
#define sPublisherUrl       'https://github.com/elixiroffice'
#define sSupportURL         'https://github.com/elixiroffice'
#define sUpdatesURL         'https://github.com/elixiroffice'
; #define sPublisherUrl       'https://github.com/elixiroffice'
; #define sSupportURL         'https://github.com/elixiroffice'
; #define sUpdatesURL         'https://github.com/elixiroffice'

#define sAppName            'ElixirOffice Document Server'
#define sAppId              'ElixirOffice DocumentServer'
#define sAppPath            'ElixirOffice\DocumentServer'
#define sAppRegPath         'Software\ElixirOffice\DocumentServer'

#if SameText(EDITION, 'developer') | SameText(EDITION, 'enterprise')
#define sProductName        sProductName + ' ' + UpperCase(Copy(EDITION,1,1)) + 'E'
#define sAppName            sAppName + ' ' + UpperCase(Copy(EDITION,1,1)) + 'E'
#define DS_ADMIN
#endif

#define sDbDefValue         'onlyoffice'
#define DS_EXAMPLE
#define DS_PLUGIN_INSTALLATION
