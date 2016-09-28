chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'http-status', ->
  http_status_module = require "../src/http-status"

  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
    @msg =
      send: sinon.spy()
    @http_status = http_status_module(@robot)

  it 'responds to http status code', ->
    expect(@robot.respond).to.have.been.calledWith(/http status (.*)/i)
  
  it 'responds to https status code', ->
    expect(@robot.respond).to.have.been.calledWith(/https status (.*)/i)
