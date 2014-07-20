
class CircularQueue
  constructor: (@n) ->

  arr: []

  i: 0

  add: (x) ->
    @arr.push x

  replace: (elem) ->
    old_val = @arr[@i]
    @arr[@i] = elem
    @i = (@i + 1) % @n
    old_val


module.exports = class
  constructor: (@period) ->
    @cq = new CircularQueue @period

  numElems: 0

  sum: 0

  current: null

  push: (n) ->
    @sum += n
    if @numElems < @period
      @cq.add n
      @numElems += 1
      @current = @sum / @numElems
    else
      old = @cq.replace n
      @sum -= old
      @current = @sum / @period

