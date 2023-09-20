import React from "react";

import * as S from "./styles";
import Img1 from "../../assets/3.png";
import Img2 from "../../assets/1.png";
import Img3 from "../../assets/2.png";

const Quantity: React.FC = () => {
  return (
    <S.Content>
      <S.BoxInfo
        style={{
          backgroundImage: `linear-gradient(to bottom, #0073ff67, #24242c),url(${Img1})`
        }}
      >
        <h3>10</h3>
        <p>Total de veículos</p>
      </S.BoxInfo>
      <S.BoxInfo 
        style={{
          backgroundImage: `linear-gradient(to bottom, #0073ff67, #24242c),url(${Img2})`
        }}>
        <h3>3</h3>
        <p>Veículos Importados</p>
      </S.BoxInfo>
      <S.BoxInfo 
        style={{
          backgroundImage: `linear-gradient(to bottom, #0073ff67, #24242c),url(${Img3})`
        }}>
        <h3>7</h3>
        <p>Veículos Nacionais</p>
      </S.BoxInfo>
    </S.Content>
  );
};

export default Quantity;
