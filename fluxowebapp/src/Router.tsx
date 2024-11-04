import { createBrowserRouter } from "react-router-dom";

import { Applayout } from "./components/layouts/AppLayout";

import NoMatch from "./pages/NoMatch";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Register from "./pages/Register";
import Sample from "./pages/Sample";

export const router = createBrowserRouter([
    {
        path: "/",
        element: <Applayout />,
        children: [
            {
                path: "",
                element: <Home />,
            },
            {
                path: "sample",
                element: <Sample />,
            },
            {
                path: "Login",
                element: <Login />,
            },
            {
                path: "Register",
                element: <Register />,
            },
        ],
    },
    {
        path: "*",
        element: <NoMatch />,
    },
], {
    basename: global.basename
})
