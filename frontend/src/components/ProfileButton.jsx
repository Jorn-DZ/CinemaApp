import React from "react";

const ProfileButton = (props) => {
  return (
    <div className="w-14 absolute top-2 right-4">
      <button {...props}>
        <img
          src="../src/assets/Media/profile.jpg"
          alt=""
          className="rounded-full"
        />
      </button>
    </div>
  );
};

export default ProfileButton;
