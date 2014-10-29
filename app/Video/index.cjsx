# @jsx React.DOM
React = require "react"

getUserMedia = require 'getusermedia'

VideoRecorder = React.createClass
  getInitialState: ->
    streamUrl: undefined

  render: ->
    <div className="module-example">
      VideoRecorder
      <video id="self-view" src={this.state.streamUrl} autoPlay/>
      <button onClick={this._onRecord}>Record</button>
      <button onClick={this._onPause}>Pause</button>
    </div>

  gotStream: (err, stream)->
    window.AudioContext = window.AudioContext or window.webkitAudioContext
    audioContext = new AudioContext()

    # Create an AudioNode from the stream
    console.log stream
    this.stream = stream

    # self view display
    this.setState streamUrl: URL.createObjectURL stream
    
    stream.onended = this.onStreamEnded

    # mediaStreamSource = audioContext.createMediaStreamSource stream

    # Connect it to destination to hear yourself
    # or any other node for processing!
    # mediaStreamSource.connect audioContext.destination

  onStreamEnded: (event)->
    console.log event

  _onRecord: ->
    getUserMedia this.gotStream

  _onPause: ->
    this.stream.stop()

module.exports = VideoRecorder