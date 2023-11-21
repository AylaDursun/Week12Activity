/**
 * @description Find functions longer than 10 lines
 * @kind problem
 * @id javascript/longer-than-10
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is longer than 10 lines.
 */
predicate longerThan10Lines(Function func) {
  func.getNumLines() > 10
}

/**
* Holds if `caller` contains a call to `callee`.
*/
predicate calls(Function caller, Function callee) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getACallee() = callee
  )
}

from Function func
where longerThan10Lines(func)
select func, "is longer than 10 lines"