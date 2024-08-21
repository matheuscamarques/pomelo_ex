defmodule PomeloEx.Cards.SensitiveInformation.Handling do
  @moduledoc """
  Integration Flow
  To display sensitive information or activated your users' cards, follow these steps:

  1. Ask us for an end user token with the token you obtained in 'Authorization'. [See documentation](https://developers.pomelo.la/en/api-reference)
  2. Use this new token as a query parameter embedding the Pomelo website in your UI.
  3. Set the styles you want and the required parameters.
  """
  alias PomeloEx.Cards.SensitiveInformation.Handling.ActivateCard
  alias PomeloEx.Cards.SensitiveInformation.Handling.DisplaySensitiveInformation

  @doc """
  Display sensitive information
  Get sensitive card information
  The website https://pomelo.la/secure-data/{card_id} lets you obtain sensitive information about a particular card.
  Embed this web page using an html iFrame or a WebView by sending the necessary parameters.

  Styles
  You can configure a style sheet to display the information.

  Important: CORS must be enabled to communicate with the style sheet address.

  The page will be displayed with no background by default, so that it can be rendered over another component.
  All components have a unique class-name that use the layout you determined when receiving a styles URL.
  The arrangement of fields varies in accordance with the layout parameter, which may be in list or card format.
  Below is the ids list:

  Card Layout

  | CSS NAME                     | DESCRIPTION                   |
  |------------------------------|-------------------------------|
  | `.card { ... }`              | Container component           |
  | `.card .pan {}`              | Card number                   |
  | `.card .pan .copy-icon {}`   | Copy button                   |
  | `.card .name {}`             | Cardholder                    |
  | `.card .expiration-date {}`  | Expiration date               |
  | `.card .security-code {}`    | Security code                 |
  | `.card .cvv-expiration-time {}` | Expiration date for dCVV    |
  | `.card .pin {}`              | Pin number                    |

  List Layout

  | CSS NAME                               | DESCRIPTION                |
  |----------------------------------------|----------------------------|
  | `.list { ... }`                        | Container component        |
  | `.list .pan {}`                        | Card number                |
  | `.list .pan .label {}`                 | PAN text                   |
  | `.list .pan .copy-icon {}`             | Copy button                |
  | `.list .name {}`                       | Cardholder                 |
  | `.list .name .label {}`                | Text above NAME            |
  | `.list .expiration-date {}`            | Expiration date            |
  | `.list .expiration-date .label {}`     | Expiration date text       |
  | `.list .security-code {}`              | Security code              |
  | `.list .security-code .label {}`       | Security code text         |
  | `.list .cvv-expiration-time {}`        | Expiration date for dCVV   |
  | `.list .cvv-expiration-time .label {}` | Text on Expiration date    |
  | `.list .pin {}`                        | Pin number                 |
  | `.list .pin .label {}`                 | Text on PIN                |

  Considerations for integrating with an iframe
  For the copy button to work you must enable writing to the clipboard as follows:

  <iframe allow='clipboard-write' ... ></iframe>
  """
  defdelegate display_sensitive_information(payload),
    to: DisplaySensitiveInformation,
    as: :execute

  @doc """
  Activate a card
  We will provide you with a web page with a form so that your customers can activate their cards by entering the 16 digits (PAN) and the PIN if necessary.

  You must embed this web page in your website or app with an HTML iframe or a WebView by submitting the necessary parameters.
  All form texts will be translated into the language indicated to us by parameter.

  Styles
  You can configure a style sheet to display the form.

  Important: CORS must be enabled to communicate with the style sheet address.

  The page will be displayed with no background by default, so that it can be rendered over another component.
  All components have a unique class-name that use the layout you determined when receiving a styles URL.
  Below is the ids list:

  CSS Classes

  | CSS NAME                             | DESCRIPTION          |
  |--------------------------------------|----------------------|
  | `.activation-form { ... }`           | Container component  |
  | `.activation-form .pan-input {}`     | Card number          |
  | `.activation-form .pin-input {}`     | Card PIN             |
  | `.activation-form .error-field {}`   | Activation errors    |
  | `.activation-form .submit-button {}` | Submit button        |

  Activation completed successfully
  If activation is successful, you will be redirected to the link submitted by parameter.
  If you are using a mobile application, you will be able to send us a deep link to continue the flow of your application.

  Handling errors
  If anything goes wrong while activating the card, the corresponding error will be displyed and the end user will be asked to try again until the activation is completed.

  React Native deployment
  To implement WebView in React Native and enable Deep Link execution, the following WebView properties must be set up.

  Override onShouldStartLoadWithRequest method
  Override onNavigationStateChange method
  Enable javascript code execution
  Snippet
  const onShouldStartLoadWithRequest = (request: any) => {
    return true;
  }

  const onNavigationStateChange = (event: any) => {
    if(!event.url.includes('secure-data-web')){
        Linking.openURL(event.url);
    }
  }

  <WebView
    source=uri: POMELO_URL
    onShouldStartLoadWithRequest={onShouldStartLoadWithRequest}
    onNavigationStateChange={onNavigationStateChange}
    javaScriptEnabled={true}
  />
  Native iOS deployment
  To implement WebView in Swift, NavigationDelegate must be set up to handle link execution.

  Snippet
  webView.navigationDelegate = self

  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    // Open URL
    let url = (navigationAction.request.url)!
    let scheme = url.scheme?.lowercased()

    if scheme != 'https' && scheme != 'http' {
        UIApplication.shared.open(url)
    }
    decisionHandler(.allow)
  }

  """
  defdelegate activate_card(payload), to: ActivateCard, as: :execute
end
