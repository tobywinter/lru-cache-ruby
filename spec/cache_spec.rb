
describe Cache do
  subject(:cache) {described_class.new }

  it 'has a container' do
    expect(cache).to respond_to :container
  end

  it 'has a setter' do
    key = 'Toby'
    value = 'Interviewee'
    expect{cache.set(key, value)}.to change{cache.container.length}.from(0).to(1)
  end

  it 'a value can be found with a key using getter' do
    key = 'Toby'
    value = 'Interviewee'
    cache.set(key, value)
    expect(cache.get(key)).to eq('Interviewee')
  end

  it 'has max length of 5' do
    key = 'T'
    value = 'I'
    key2 = 'X'
    value2 = 'Y'
    5.times {cache.set(key, value)}
    cache.set(key2, value2)
    expect(cache.container.length).to eq(5)
  end

  it 'setting a new element pops the least recently used element when full' do
    key2 = 'Much'
    value2 = 'Wow'
    cache.set('Good', 'Dog')
    expect(cache.container[-1]).to eq(['Good', 'Dog'])
    4.times {cache.set('Oh', 'My')}
    cache.set('Much', 'Wow')
    expect(cache.container[0]).to eq(['Much', 'Wow'])
    expect(cache.container[-1]).to eq(['Oh', 'My'])
  end

  it 'getter moves selected element to index 0' do
    2.times {cache.set('Good', 'Dog')}
    4.times {cache.set('Oh', 'My')}
    expect{cache.get('Good')}.to change{cache.container[0]}.from(['Oh', 'My']).to(['Good', 'Dog'])
  end

end
