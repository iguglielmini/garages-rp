import styled from "styled-components";

export const Content = styled.div`
  padding: 32px;
  width: 1024px;
  height: 660px;
  border-radius: 28px;
  background-color: #0b0c16;
`;

export const Box = styled.div`
  display: flex;
  flex-direction: row;
  align-items: flex-start;
  justify-content: flex-start;
  margin-top: 24px;
`;

export const CardDiv = styled.div`
  max-width: 100%;
  max-height: 500px;
  overflow-x: auto;
  white-space: nowrap;

  display: flex;
  align-items: center;
  justify-content: flex-start;
  flex-wrap: wrap;
  margin-left: 24px;

  &::-webkit-scrollbar {
    width: 10px;
    height: 8px;
  }

  &::-webkit-scrollbar-thumb {
    background-color: #0073ff67;
    border-radius: 8px;
  }

  &::-webkit-scrollbar-track {
    background-color: #24242c;
    border-radius: 8px;
  }
`;
