package src.java.lib.utils;

public class Config {

    // Account value
    public static class Role{
        public static final int ADMIN  = 0;
        public static final int BUYER  = 1;
        public static final int SELLER = 2;
    }
    
    public static class Status{
        public static final int ACTIVE      = 1;
        public static final int IN_ACTIVE   = 0;
        public static final int PENDING     = 1;
        public static final int CANCEL      = 2;
    }
    
    public static class User{
        public static final int PROFILE = 1;
        public static final int ORDERS = 4;
    }
    
    public static class Admin{
//        public static final int PROFILE = 1;
        public static final int ACCOUNTS = 2;
        public static final int PLANTS = 3;
//        public static final int ORDERS = 4;
        public static final int CATEGORIES = 5;
    }

    public static class Option{
        public static final String NAME = "1";
        public static final String CATEGORY = "2";
    }
    
    // Register value
    public static class Register{
        public static final int PASSWORD_MIN            = 8;
        public static final int PASSWORD_MAX            = 15;
        public static final int PASSWORD_LENGTH_ERROR   = 1;
        public static final int PASSWORD_FORMAT_ERROR   = 2;
        public static final int EMAIL_EXIST_ERROR       = 3;
        public static final int PASSWORD_VALID          = 4;
        public static final int REGISTER_SUCCESS        = 5;
        public static final int REGISTER_FAIL           = 6;
    }

    // Controller
    public static class Controller {
        public static final String HOME          = "1";
        public static final String LOGIN         = "2";
        public static final String LOGOUT        = "3";
        public static final String REGISTER      = "4";
        public static final String SEARCH        = "5";
        public static final String DETAIL        = "6";
        public static final String ADMIN         = "7";
        public static final String CART          = "8";
        public static final String ADD_TO_CART   = "9";
        public static final String CHECKOUT      = "10";
    }

    // Action
    public static class Action {
        private static final String MAIN = "main?action=";
        public static final String HOME          = MAIN + Controller.HOME;
        public static final String LOGIN         = MAIN + Controller.LOGIN;
        public static final String LOGOUT        = MAIN + Controller.LOGOUT;
        public static final String REGISTER      = MAIN + Controller.REGISTER;
        public static final String SEARCH        = MAIN + Controller.SEARCH;
        public static final String DETAIL        = MAIN + Controller.DETAIL;
        public static final String ADMIN         = MAIN + Controller.ADMIN;
        public static final String CART          = MAIN + Controller.CART;
        public static final String ADD_TO_CART   = MAIN + Controller.ADD_TO_CART;
        public static final String CHECKOUT      = MAIN + Controller.CHECKOUT;
    }

    // Page
    public static class Page{
        public static final String HOME     = "view/home.jsp";
        public static final String LOGIN    = "view/login.jsp";
        public static final String REGISTER = "view/register.jsp";
        public static final String USER     = "view/user.jsp";
        public static final String ADMIN    = "view/admin.jsp";
        public static final String CART     = "view/cart.jsp";
        public static final String SEARCH   = "view/search.jsp";
        public static final String DETAIL   = "view/detail.jsp";
        public static final String ORDER_DETAIL   = "view/orderDetail.jsp";
        public static final String ERROR    = "view/error.jsp";
    }

    public static class Url{
        public static final String HOME          = "/PlantShop/";
        public static final String LOGIN         = "login";
        public static final String LOGOUT        = "logout";
        public static final String REGISTER      = "register";
        public static final String REMOVE        = "remove";
        public static final String SEARCH        = "search";
        public static final String DETAIL        = "detail";
        public static final String ADMIN         = "admin";
        public static final String USER          = "user";
        public static final String CART          = "cart";
        public static final String ADD_TO_CART   = "addtocart";
        public static final String CHECKOUT      = "checkout";
        public static final String ERROR         = "error";
        public static final String CATEGORY      = "category";
        public static final String UPDATE_CATEGORY      = "updatecategory";
        public static final String UPDATE_ACCOUNT       = "updateaccount";
        public static final String UPDATE_ORDER         = "updateorder";
        public static final String UPDATE_PLANT         = "updateplant";
        public static final String ADD_PLANT            = "addplant";
        public static final String ADD_CATEGORY         = "addCate";
        public static final String CHANGE_ACC_STATUS    = "changestatus";
        public static final String DETAIL_ORDER         = "orderdetail";
        public static final String SORT_ORDER           = "sortorder";
    }

    // Component
    public static class Component{
        public static final String TABLE        = "component/table.jsp";
        public static final String DETAIL_CARD  = "component/card.jsp";
        public static final String HEADER       = "component/header.jsp";
        public static final String FOOTER       = "component/footer.jsp";
        public static final String SIDE_BAR     = "component/sideBar.jsp";
    }

    // Message
    public static class Message{
        public static final String ERROR                    = "Something went wrong! Please try again";
        public static final String LOGIN_FAILED             = "Login failed! Please try again";
        public static final String LOGOUT_FAILED            = "Logout failed! Please try again";
        public static final String ORDER_FAILED             = "Order failed! Please try again";
        public static final String REGISTER_FAILED          = "Register failed! Please try again";
        public static final String UPDATE_FAILED            = "Update failed! Please try again";
        public static final String INSERT_FAILED            = "Insert failed! Please try again";
        public static final String PASSWORD_MIN_ERROR       = "Password too short! At least 8 character";
        public static final String PASSWORD_MAX_ERROR       = "Password too long! Max 15 character";
        public static final String PASSWORD_FORMAT_ERROR    = "Password contain special character";
        public static final String PASSWORD_CONFIRM_ERROR   = "Confirm password not match!";
        public static final String EMAIL_EXIST_ERROR        = "Email existed! Please try another email";
        public static final String PHONE_EXIST_ERROR        = "Phone existed! Please try another phone number";
        public static final String EMAIL_AND_PHONE_EXIST_ERROR = "Email and Phone existed! Please try another email and phone number";
    }

    // Attribute
    public static class Attribute {
        /**
         * lưu Account
         */
        public static final String USER = "user";
        /**
         * 
         */
        public static final String MSG = "message";
        /**
         * 
         */
        public static final String TOKEN = "token";
        /**
         * lưu Plant list
         */
        public static final String SEARCH_RESULT = "search_result";
        /**
         * lưu search word
         */
        public static final String SEARCH_VALUE = "search_value";
        /**
         * lưu map<id, quantity>
         */
        public static final String CART = "cart";
        public static final String CART_ITEMS = "cart_items";
        public static final String DETAIL = "detail";
        public static final String ACTIVITY = Param.ACTIVITY;
        public static final String PROFILE = "profile";
        public static final String ACCOUNTS = "accounts";
        public static final String PLANTS = "plants";
        public static final String ORDERS    = "orders";
        public static final String ORDER    = "order";
        public static final String ORDER_DETAIL    = "order_detail";
        public static final String CATEGORIES    = "categories";
        public static final String SORT_VALUE = "search_value";
        public static final String OPTION = "option";
    }

    // Parameter
    public static class Param{
        public static final String NAME             = "name";
        public static final String EMAIL            = "email";
        public static final String PRICE            = "price";
        public static final String DESCRIPTION      = "description";
        public static final String IMG              = "image";
        public static final String PHONE            = "phone";
        public static final String PASSWORD         = "password";
        public static final String PASSWORD_CONFIRM = "password-confirm";
        public static final String ID               = "id";
        public static final String CATE_ID          = "cate_id";
        public static final String STATUS           = "status";
        public static final String SEARCH           = "search";
        public static final String OPTION           = "option";
        public static final String QUANTITY         = "quantity";
        public static final String ACTIVITY         = "activity";
        public static final String FROM_DATE        = "from";
        public static final String TO_DATE          = "to";
        
        public static final String TEST = "test";
    }
}
