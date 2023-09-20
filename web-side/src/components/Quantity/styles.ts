import styled from "styled-components";

export const Content = styled.div`
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-top: 32px;
`;

export const BoxInfo = styled.div`
  width: 120px;
  height: 150px;
  border: 1px solid white;
  border-radius: 16px;
  background-color: black;
  color: white;

  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  text-align: center;

  background-size: cover;
  background-repeat: no-repeat;

  h3 {
    font-size: 24px;
    font-weight: 600;
  }
  p{
    font-size: 18px;
    font-weight: 400;
  }
`;
