import React from "react";

import * as S from "./styles";
import { Header, InfoCar, Quantity } from "../../components";
import { ListCard } from "../../components/ListCard";
import { CardCarMock } from "../../mocks/listcard.mock";

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
        <S.CardDiv>
          {CardCarMock.map((car) => (
            <ListCard key={car.id} {...car} />
          ))}
        </S.CardDiv>
      </S.Box>
    </S.Content>
  );
};

export default Garage;
