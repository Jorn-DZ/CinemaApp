import React, { useRef } from "react";
import { Formik, Form, Field, useFormik } from "formik";
import * as Yup from "yup";
import BackButton from "../components/BackButton";
import { useNavigate } from "react-router-dom";
import Cookies from "js-cookie";
import { loginUser } from "../api";

const LoginPage = () => {
  const errorRef = useRef();
  const navigate = useNavigate();

  const validationSchema = Yup.object().shape({
    email: Yup.string()
      .email("Ongeldig e-mailadres.")
      .required("E-mail is verplicht."),
    password: Yup.string().required("Wachtwoord is verplicht."),
  });

  const { values, handleSubmit, handleChange, dirty, isValid } = useFormik({
    initialValues: {
      email: "",
      password: "",
    },
    onSubmit: async (values) => {
      //inloggen als user bestaat
      try {
        const email = values.email;
        const password = values.password;
        const response = await loginUser({ email, password });

        if (response.status === 200) {
          const token = response.data.token;
          Cookies.set("token", token, { expires: 1, path: "/" });

          navigate("/");
        }
      } catch (error) {
        console.error("Error bij login", error.message);
      }
    },
    validationSchema: validationSchema,
  });

  return (
    <div className="flex justify-center h-screen items-center">
      <Formik>
        <Form
          className="bg-cyan-950 h-2/3 w-1/3 rounded-md"
          onSubmit={handleSubmit}
        >
          <h1 className="text-center text-white font-bold text-6xl pt-8 h-1/4">
            LOGIN
          </h1>
          <div className="flex flex-col h-1/2">
            <div className="pb-6 mt-12 w-full text-center">
              <Field
                type="email"
                name="email"
                className="w-1/2 h-8 border-b rounded-t-md border-white bg-transparent text-white p-1"
                placeholder="Email"
                value={values.email}
                onChange={handleChange}
              />
            </div>
            <div className="pt-12 w-full text-center">
              <input
                type="password"
                name="password"
                className="w-1/2 h-8 border-b border-white bg-transparent text-white p-1"
                placeholder="Password"
                value={values.password}
                onChange={handleChange}
              />
              <div>
                <p
                  className="text-blue-300 hover:cursor-pointer pt-2"
                  onClick={() => {
                    navigate("/register");
                  }}
                >
                  Nog geen account? Registreer.
                </p>
              </div>
              <div>
                <p className="text-red-500 pt-6" hidden="True" ref={errorRef}>
                  Foute inloggegevens.
                </p>
              </div>
            </div>
          </div>
          <div className="h-1/4 pt-12">
            <div className="flex flex-wrap justify-center">
              <div className="px-4">
                <button
                  type="submit"
                  className="bg-white text-cyan-950 border-2 border-cyan-950 py-1 px-3 rounded-md w-32 hover:bg-cyan-950 hover:text-white hover:border-white"
                  disabled={!isValid || !dirty}
                >
                  Login
                </button>
              </div>
              <div className="px-4">
                <BackButton
                  onClick={() => {
                    navigate("/");
                  }}
                />
              </div>
            </div>
          </div>
        </Form>
      </Formik>
    </div>
  );
};

export default LoginPage;
