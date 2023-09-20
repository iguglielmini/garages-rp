import React from "react";

import {
  MdGarage,
  MdOutlineClose,
  MdDirectionsCar,
  MdCarRepair,
  MdFavoriteBorder,
} from "react-icons/md";
import * as S from "./styles";

interface IHeader {
  title?: string;
  myCar?: () => void;
  favorite?: () => void;
  impoundCar?: () => void;
  closeButton?: () => void;
}

const Header: React.FC<IHeader> = ({
  title,
  myCar,
  favorite,
  impoundCar,
  closeButton,
}) => {
  return (
    <S.Content>
      <S.ContentInfo>
        <div>
          <MdGarage color="#fff" size={32} />
          <p>{title}</p>
        </div>
        <S.GroupButton>
          <button onClick={favorite}>
            <MdFavoriteBorder color="#fff" size={21} />
          </button>
          <button onClick={myCar}>
            <MdDirectionsCar color="#fff" size={21} />
          </button>
          <button onClick={impoundCar}>
            <MdCarRepair color="#fff" size={21} />
          </button>
        </S.GroupButton>
      </S.ContentInfo>
      <S.ContentClose>
        <S.ButtonClose onClick={closeButton}>
          <MdOutlineClose color="#fff" size={42} />
        </S.ButtonClose>
      </S.ContentClose>
    </S.Content>
  );
};
export default Header;
