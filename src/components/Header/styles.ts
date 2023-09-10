import styled from "styled-components";

export const Content = styled.div`
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
`;

export const ContentInfo = styled.div`
  display: flex;
  align-items: center;
  justify-content: flex-start;

  div {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    padding-right: 42px;

    p {
      color: #fff;
      font-size: 18px;
      font-weight: 700;
      font-style: normal;
      font-family: Arial, Helvetica, sans-serif;
      padding-left: 12px;
    }
  }
`;
export const GroupButton = styled.div`
  display: flex;
  align-items: center;
  justify-content: flex-start;

  button {
    padding: 10px;
    display: flex;
    border-radius: 8px;
    align-items: center;
    justify-content: center;
    background-color: #171a24;
    border: 1px solid #171a24;
    transition: 0.3s all ease-in;
    margin-right: 12px;
  }
  button:hover {
    background-color: #9fc0ff;
    border: 1px solid #9fc0ff;
  }
`;

export const ContentClose = styled.div``;

export const ButtonClose = styled.button`
  display: flex;
  border-radius: 50%;
  align-items: center;
  border: 1px solid #fff;
  background: transparent;
  justify-content: center;
`;
