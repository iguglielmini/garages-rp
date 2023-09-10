import styled from "styled-components";

export const Content = styled.div`
  display: flex;
  flex-wrap: wrap;
  align-items: flex-start;
  justify-content: flex-start;
`;

export const Card = styled.button`
  width: 150px;
  height: 110px;
  border: 1px solid white;
  border-radius: 8px;
  transition: 0.3s all;
  margin-right: 16px;
  margin-bottom: 16px;

  &:hover {
    width: 170px;
    height: 130px;
  }
`;

export const Imagecontent = styled.div`
  width: 100%;
  height: 100%;
  border-radius: 8px;

  display: flex;
  flex-direction: column;
  justify-content: space-between;

  background-size: cover;
  background-repeat: no-repeat;

  .button-ajusts {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: flex-end;
  }

  button {
    width: 30px;
    height: 30px;
    border: none;
    background-color: transparent;
    padding-top: 4px;
    display: flex;
    align-items: center;
    justify-content: center;

    transition: all.3s;
  }

  button:hover {
    background-color: red;
    border-top-right-radius: 8px;
  }
  .info-card {
    color: white;
    padding-left: 10px;
    padding-bottom: 8px;
    text-align: left;

    h3 {
      font-size: 14px;
    }
    p {
      font-size: 12px;
    }
  }
`;
