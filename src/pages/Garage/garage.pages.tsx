import React from "react";

import * as S from "./styles";
import { Header, InfoCar, Quantity } from "../../components";
import { ListCard } from "../../components/ListCard";

const Garage: React.FC = () => {
  return (
    <S.Content>
      <Header
        title="Garagem da Praça"
        myCar={() => {}}
        favorite={() => {}}
        impoundCar={() => {}}
      />
      <S.Box>
        <div>
          <InfoCar />
          <Quantity />
        </div>
        <ListCard />
      </S.Box>
    </S.Content>
  );
};

export default Garage;
