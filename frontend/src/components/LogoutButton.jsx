import React from "react";

const LogoutButton = (props) => {
  return <button {...props}>{props.children}</button>;
};

export default LogoutButton;
