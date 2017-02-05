import {translateInput} from 'enigma';
import SocketHandler from 'SocketHandler';

export default class MessageStore {
  constructor() {
    riot.observable(this);
    this.messages = [];

    this.settings = {
      leftRotor   : 1,
      middleRotor : 2,
      rightRotor  : 3,
      leftShift   : 0,
      middleShift : 0,
      rightShift  : 0,
      plugboard   : []
    };

    this.on('message.send', this.sendMessage.bind(this));

    this.on('settings.change', this.updateSettings.bind(this));
    this.on('settings.get', this.getSettings.bind(this));

    this.socket = new SocketHandler(this.handleMessage.bind(this));
  }

  sendMessage(msg) {
    this.socket.sendMessage(translateInput(msg, this.settings));
  }

  handleMessage(msg) {
    let newMsg = {
      encodedMessage: msg,
      decodedMessage: translateInput(msg, this.settings),
      timestamp: new Date().toString()
    };
    this.messages.push(newMsg);
    this.trigger('message.new', this.messages);
  }

  updateSettings(settings) {
    this.settings = {
      leftRotor   : settings.leftRotor   || this.settings.leftRotor,
      middleRotor : settings.middleRotor || this.settings.middleRotor,
      rightRotor  : settings.rightRotor  || this.settings.rightRotor,
      leftShift   : settings.leftShift   || this.settings.leftShift,
      middleShift : settings.middleShift || this.settings.middleShift,
      rightShift  : settings.rightShift  || this.settings.rightShift,
      plugboard   : settings.plugboard   || this.settings.plugboard
    };

    this.trigger('settings.update', this.settings);
  }

  getSettings() {
    this.trigger('settings.update', this.settings);
  }


}
