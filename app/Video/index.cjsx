# @jsx React.DOM
React = require "react"

getUserMedia = require 'getusermedia'

VideoRecorder = React.createClass
  getInitialState: ->
    streamUrl: undefined

  render: ->
    <div className="module-example">
      VideoRecorder
      <video id="self-view" ref="video" src={this.state.streamUrl} autoPlay width="440" height="320" muted/>
      <button onClick={this._onRecord}>Record</button>
      <button onClick={this._onPause}>Pause</button>
      <button onClick={this._onCanvasLoaded}>Snapshot</button>
      <canvas ref="canvas" width="440" height="320"></canvas>
      <canvas ref="ghostCanvas" width="440" height="320"></canvas>
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

    this.startReading()

    # mediaStreamSource = audioContext.createMediaStreamSource stream

    # Connect it to destination to hear yourself
    # or any other node for processing!
    # mediaStreamSource.connect audioContext.destination
  
  snapshot: (canvas)->
    if this.stream
      canvasContext = canvas.getContext('2d')
      canvasContext.drawImage(this.refs.video.getDOMNode(), 0, 0, 440, 320)

  startReading: ->
    ghostCanvas = this.refs.ghostCanvas.getDOMNode()
    this.intervalId = setInterval (->
        this.snapshot(ghostCanvas)
        console.log 'draw'
      ).bind(this)
    , 100

  _onCanvasLoaded: ()->
    this.snapshot this.refs.canvas.getDOMNode()

  onStreamEnded: (event)->
    console.log event
    clearInterval(this.intervalId);

  _onRecord: ->
    getUserMedia this.gotStream

  _onPause: ->
    this.stream.stop()

module.exports = VideoRecorder