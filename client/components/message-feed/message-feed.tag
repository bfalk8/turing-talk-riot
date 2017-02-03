import style from './message-feed.css';
import {update, handleScroll, updateMessages} from './message-feed.js';
import 'components/message/message.tag';

<message-feed ref='feed' class={style.root} onscroll={handleScroll}>
    <message each={messages} 
      encodedmessage={encodedMessage} 
      decodedmessage={decodedMessage}
      timestamp={timestamp}
    />

  <script>
    this.style = style;
    this.messages = [];
    this.shouldScroll = true;
    this.handleScroll = handleScroll.bind(this);
    this.on('updated', update.bind(this));
    riot.control.on('message.new', updateMessages.bind(this));
  </script>
</message-feed>
