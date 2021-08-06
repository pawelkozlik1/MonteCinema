# Montecinema_PK

Implementaiton of Rubycamp project - Monte Cinema. 

## API specification
Functionalities required 

1. Login + registration
2. Athorization for different roles (normal client, manager, employee)
3. Internal reservation system (for managment)
4. APi for communication with automated devices (something different than  simple REST API would be nice)
5. External/public reservation system (for normal client and only online)
6. No online payment
7. Promotions related to snackbar (ex. point system)
8. Can expect changes to the whole project

## Functional requirements
1. Automatic ticket reservation cancellation if not paid at cinema desk min. 30mins before the screening)
2. Confirmation email on new reservation
3. Cancellation email on canceling reservation (can also think about one for not paying in the required timeframe)

## Technical requirements 
1. Rails version > 6
2. PostgreSQL 
3. Standarazed public API
4. Private API should be both elastic and secure

## Commit convention 
(This is for me to remember and stick to it)

Summary (required):
- use the imperative, present tense: "change" not "changed" nor "changes"
- don't capitalize first letter
- no dot (.) at the end

Type (optional, would propably be a good idea to make it required)
- **build:** Changes that affect the build system
- **docs:** Documentation only changes 
- **feat:** A new feature
- **fix:** A bug fix
- **perf:** A code change that improves performance
- **refactor:** A code change that neither fixes a bug nor adds a feature
- **test:** Adding missing tests or correcting existing tests


