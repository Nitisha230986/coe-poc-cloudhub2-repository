%dw 2.0
output application/json
var result = if (payload.result.pass[0]) " is ok" else " failed"
---
{
    result: "The suite <" ++ payload.name ++ "> with assertion <" ++ payload.result[0].name ++ ">" ++ result
}
