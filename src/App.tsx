import React, { Fragment } from "react";
import GlobalStyle from "./styles/global";
import { Garage } from "./pages";

const App: React.FC = () => {
  return (
    <Fragment>
      <GlobalStyle />
      <Garage />
    </Fragment>
  );
};

export default App;
