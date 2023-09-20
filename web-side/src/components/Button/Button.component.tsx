import React, { HTMLAttributes } from "react";

interface IButtonProps extends HTMLAttributes<HTMLButtonElement> {
  click: () => void;
}

const ButtonComponent: React.FC<IButtonProps> = ({
  click,
  children,
  ...rest
}) => {
  return (
    <button {...rest} onClick={click}>
      {children}
    </button>
  );
};
export default ButtonComponent;
