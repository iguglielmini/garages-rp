import React, { useState } from "react";

import * as S from "./styles";
import { Header, InfoCar, Quantity } from "../../components";
import { ListCard } from "../../components/ListCard";
import { CardCarMock } from "../../mocks/listcard.mock";

const Garage: React.FC = () => {
  const [isVisible, setIsVisible] = useState(true);
  return (
    <S.Bg style={{ display: isVisible ? "flex" : "none" }}>
      <S.Content>
        <Header
          title="Garagem da Praça"
          myCar={() => {}}
          favorite={() => {}}
          impoundCar={() => {}}
          closeButton={() => setIsVisible(false)}
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
    </S.Bg>
  );
};

export default Garage;
