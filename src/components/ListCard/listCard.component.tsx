import React from "react";
import { MdFavoriteBorder } from "react-icons/md";

import * as S from "./styles";
import Img2 from "../../assets/1.png";

interface IListCard {
  image: string;
  name: string;
  plate: string;
  id: any;
}


const ListCard: React.FC<IListCard> = ({ image, name, plate, id }) => {
  return (
    <S.Content>
      <S.Card>
        <S.Imagecontent
          style={{
            backgroundImage: `linear-gradient(to bottom, #0073ff67, #24242c),url(${image})`,
          }}
        >
          <div className="button-ajusts">
            <button onClick={() => {}}>
              <MdFavoriteBorder color="#fff" size={21} />
            </button>
          </div>
          <div className="info-card">
            <h3>{name}</h3>
            <p>{plate}</p>
          </div>
        </S.Imagecontent>
      </S.Card>
    </S.Content>
  );
};

export default ListCard;
