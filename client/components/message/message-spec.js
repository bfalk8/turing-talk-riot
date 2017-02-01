import './message.tag';
describe('Message spec', function() {
  let tag = {};

  before(function() {
    var html = document.createElement('message');
    document.body.appendChild(html);
    tag = riot.mount('message')[0];
  });

  it('mounts a hello tag', function() {
    expect(tag).to.exist;
    expect(tag.isMounted).to.be.true;
  });

  it('completes test', function() {
    expect(1).to.equal(1);
  })
})
