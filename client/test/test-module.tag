import style from './test-module.css';
import 'components/message-feed/message-feed.tag';
import 'components/message-input/message-input.tag';
 
<test-module>
  <div style='height:300px'>
  <button onclick={this.addMessage}>
    ADD
  </button>
  <message-feed style='height: 65%' messages={messages} />
  <message-input />
  </div>


  <script>
    this.style = style;
    this.messages= [
    {
      encodedMessage: 'caKdf',
      decodedMessage: 'hello',
      timestamp: 'SOMETIME'
    }
    ];

    this.addMessage = () => {
      this.messages.push(
        {
          encodedMessage: 'caKdf',
          decodedMessage: 'hello',
          timestamp: 'SOMETIME'
        });
    };

    riot.control.on('message-input', (msg) => {
      this.messages.push(
        {
          encodedMessage: msg,
          decodedMessage: 'hello',
          timestamp: 'SOMETIME'
        }
      );
      this.update();
    });
  </script>

</test-module>
