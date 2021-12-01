import logo from './logo.svg';
import './App.css';

const works = [
  'http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg',
  'http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg',
  'http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg',
  'http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg',
  'http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg',
  'http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg',
  'http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg',
  'http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg',
  'http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg',
]

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1>Pairing exercise - Frontend</h1>
      </header>
      <main>
        <section>
          <h2>Works</h2>
          <ul className="App-works">
            {works.map((work, index) => (
              <li key={index} className="App-work">
                <img src={work} alt={index} className="App-workimage"/>
              </li>
            ))}
          </ul>
        </section>
      </main>
    </div>
  );
}

export default App;
