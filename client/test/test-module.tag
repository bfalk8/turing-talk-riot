import style from './test-module.css';
import 'components/message-feed/message-feed.tag';
import 'components/message-input/message-input.tag';
import SocketHandler from 'SocketHandler';
 
<test-module>
  <div style='height:300px'>
  <message-feed style='height: 65%' />
  <message-input />
  </div>


  <script>
    this.style = style;

    this.on('mount', () => {
      this.socket = new SocketHandler();
    });
  </script>

</test-module>
