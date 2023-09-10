import { createGlobalStyle } from "styled-components";

export default createGlobalStyle`
* {
  margin: 0;
  padding: 0;
  outline: 0;
  box-sizing: border-box;
}

*:focus {
  outline: 0;
}

html, body, #root {
  height: 100%;
}

#root{
  display: flex;
  align-items: center;
  justify-content: center;
}

body {
  -webkit-font-smoothing: antialiased;
  position: relative;
  min-height: 100%;
  font-feature-settings: 'kern';
}

body, input, button{
  font-size: 14px;
}

body, input, textarea, button, ul, li, a, b, p, span, h1, h2, h3 {
  font-family: 'Chicken Sans', 'FlameCondensed', 'Flame', 'Flame Sans', sans-serif;
}

a {
  text-decoration: none;
}

ul {
  list-style: none;
}

li {
  cursor: pointer;
}

button {
  cursor: pointer;
}
`;
