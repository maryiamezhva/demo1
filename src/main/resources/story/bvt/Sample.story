Description: Integration tests for AccessibilitySteps class.

Meta:
    @epic vividus-plugin-accessibility

Scenario: Sample GET request
When I execute HTTP GET request for resource with URL `${base-endpoint}`
Then `${responseCode}` is equal to `200`
Then JSON element value from context by JSON path `$.eye_color` is equal to `blue`



Scenario: Sample POST request
Given I initialize SCENARIO variable `password` with value `#{generate(Internet.password '5', '10', 'true')}`
Given request body:
{
  "user": {
    "username": "#{generate(numerify 'TestUser####')}",
    "email": "#{generate(letterify 'automationtst????@mailinator.com')}",
    "password": "${password}"
  }
}

When I set request headers:
|name        |value           |
|Content-Type|application/json|
|Accept      |application/json|
When I execute HTTP POST request for resource with relative URL `users`
Then `${responseCode}` is equal to `200`
When I save JSON element from `${json-context}` by JSON path `user..token` to STORY variable `<variableName>`
Examples:
|username                            |email                                                    |variableName|
|#{generate(numerify 'TestUser####')}|#{generate(letterify 'automationtst????@mailinator.com')}|token1      |
|#{generate(numerify 'TestUser####')}|#{generate(letterify 'automationtst????@mailinator.com')}|token2      |