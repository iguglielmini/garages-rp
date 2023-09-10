import styled from "styled-components";

export const Content = styled.div`
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  width: 400px;
  height: 325px;
  background-position: center;

  border: 1px solid #fff;
  border-radius: 10px;
  padding: 24px 16px;
`;

export const InfoCar = styled.div`
  display: flex;
  width: 100%;
  flex-direction: column;
  align-items: flex-start;

  h3 {
    color: #fff;
    font-weight: 800;
    padding-bottom: 8px;
  }
  span {
    color: #fff;
    padding-bottom: 32px;
    letter-spacing: 0.3px;
  }
`;
export const ButtonContent = styled.div`
  display: flex;
  width: 100%;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;

  button {
    width: 180px;
    height: 50px;
    padding: 16px 24px;
    background-color: #1f2129;
    border-radius: 8px;
    color: #fff;
    border: 1px solid #1f2129;
    transition: 0.3s all;
  }
  button:hover {
    color: #1f2129;
    background-color: #9fc0ff;
  }
`;

export const InfoEngine = styled.div`
  width: 100%;
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  padding-top: 24px;
`;

export const DivTanque = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
`;

export const Tanque = styled.div`
  width: 80px;
  height: 100px;
  background-color: #2e3443;
  border-radius: 8px;
  display: flex;
  align-items: flex-end;
  justify-content: center;

  span {
    width: 100%;
    height: 69%;
    padding: 8px;
    background-color: #9fc0ff;
    border-bottom-left-radius: 8px;
    border-bottom-right-radius: 8px;

    font-size: 14px;
    font-weight: bold;
    text-align: center;
    color: #2e3443;
  }
`;
export const TextContent = styled.div`
  padding-top: 8px;
  color: #fff;

  p {
    font-size: 16px;
    font-weight: 600;
  }
  span {
    font-size: 12px;
    font-weight: 400;
  }
`;

export const DivStatusGeneral = styled.div`
  width: 100%;
  display: flex;
  align-items: flex-start;
  flex-direction: column;
`;

export const DivLataria = styled.div`
  width: 100%;
  padding-left: 16px;
  margin-bottom: 16px;

  p {
    color: white;
    font-size: 16px;
    font-weight: 600;
    padding-bottom: 4px;
  }
`;

export const StatusLataria = styled.div`
  width: 100%;
  height: 20px;
  background-color: #2e3443;
  border-radius: 16px;
`;

export const Lataria = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  width: 20%;
  height: 20px;
  border-radius: 16px;
  background-color: #007fff;
  padding: 0 8px;
  text-align: center;
  p {
    font-size: 10px;
    padding-left: 8px;
  }
`;

export const Motor = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;

  width: 20%;
  height: 20px;
  border-radius: 16px;
  background-color: #007fff;
  padding: 0 8px;
  text-align: center;

  p {
    font-size: 10px;
    padding-left: 8px;
  }
`;
