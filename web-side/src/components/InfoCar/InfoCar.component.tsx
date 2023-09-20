import React from "react";
import * as S from "./styles";
import ImgBg from "../../assets/bg-info.png";

interface IInfoCar {
  name?: string;
  plate?: string;
  engine?: string;
  gasoline?: string;
}

const InfoCar: React.FC<IInfoCar> = () => {
  return (
    <S.Content
      style={{
        backgroundImage: `url(${ImgBg})`,
        backgroundSize: "cover",
      }}
    >
      <S.InfoCar>
        <h3>Civic Type-R</h3>
        <span>86IT2190</span>
        <S.ButtonContent>
          <button>Retirar veículo</button>
          <button>Guardar veículo</button>
        </S.ButtonContent>
      </S.InfoCar>
      {/* Info de engine */}
      <S.InfoEngine>
        <S.DivTanque>
          <S.Tanque>
            <span>69 Litros</span>
          </S.Tanque>
          <S.TextContent>
            <p>Gasolina</p>
          </S.TextContent>
        </S.DivTanque>
        {/* Status Lataria */}
        <S.DivStatusGeneral>
          <S.DivLataria>
            <p>Lataria</p>
            <S.StatusLataria>
              <S.Lataria>
                <p>20%</p>
              </S.Lataria>
            </S.StatusLataria>
          </S.DivLataria>
          {/* Status Motor */}
          <S.DivLataria>
            <p>Motor</p>
            <S.StatusLataria>
              <S.Motor>
                <p>10%</p>
              </S.Motor>
            </S.StatusLataria>
          </S.DivLataria>
        </S.DivStatusGeneral>
      </S.InfoEngine>
    </S.Content>
  );
};
export default InfoCar;
