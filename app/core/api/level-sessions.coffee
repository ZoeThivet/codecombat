fetchJson = require './fetch-json'

module.exports = {
  submitToRank: ({ session, courseInstanceId }, options) ->
    fetchJson('/queue/scoring', _.merge({}, options, {
      method: 'POST'
      json: { session, courseInstanceId }
    }))

  getByStudentsAndLevels: ({ earliestCreated, studentIds, levelOriginals, project }, options) ->
    fetchJson("/db/level.session/-/levels-and-students", _.merge({}, options, {
      method: 'POST'
      json: { earliestCreated, studentIds, levelOriginals, project }
    }))

  setKeyValue: ({ sessionID, key, value }, options) ->
    fetchJson("/db/level.session/#{sessionID}/key-value-db/#{key}", _.merge({}, options, {
      method: 'PUT'
      json: value
    }))

  incrementKeyValue: ({ sessionID, key, value }, options) ->
    value ?= 1
    fetchJson("/db/level.session/#{sessionID}/key-value-db/#{key}/increment", _.merge({}, options, {
      method: 'POST'
      json: value
    }))

  fetchForClassroomMembers: (classroomID, options) ->
    fetchJson("/db/classroom/#{classroomID}/member-sessions", _.merge({}, options, {
      method: 'GET'
      remove: false
    }))

  update: (levelSession, options={}) ->
    fetchJson("/db/level.session/#{levelSession._id}", _.assign({}, options, {
      method: 'PUT'
      json: levelSession
    }))
  
  fetchMySessions: (levelOriginal, options={}) ->
    fetchJson("/db/level/#{levelOriginal}/my_sessions", options)

  fetchForCampaign: (campaignHandle, options) ->
    fetchJson("/db/campaign/#{campaignHandle}/sessions", options)

  fetchCompletedByDate: (date, options={}) ->
    fetchJson("/db/level.session/#{me.id}/completed/#{date}", options)
}
