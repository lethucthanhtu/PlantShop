<%@page import="src.java.lib.utils.Config.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="bodier" style="background-color: rgb(249, 246, 240);">
    <!-- plant info 1 -->
    <section class="w-screen flex items-center justify-center align-center font-semibold">
        <div class="w-1/2 content-box">
            <h2 class="title" data-reveal="left">
                Plant made easy
            </h2>
            <p class="text" data-reveal="left">
                Patch helps you discover the best plants for your space, delivers them to your door and helps you
                look after them.
            </p>
            <button type="button" class="py-2.5 px-20 mr-2 mb-2 mt-5 text-sm font-medium text-gray-900 focus:outline-none rounded-lg border border-gray-900 hover:bg-black hover:text-white focus:z-10 focus:ring-4 focus:ring-gray-200">
                Shop Valentine's gifts
            </button>
            <br>
            <form action="<%=Url.SEARCH%>" method="post">
                <input type="hidden" name="<%=Param.SEARCH%>">
                <input type="hidden" name="<%=Param.OPTION%>">
                <button type="submit" class="py-2.5 px-20 mr-2 mb-2 mt-5 text-sm font-medium text-gray-900 focus:outline-none rounded-lg border border-gray-900 hover:bg-black hover:text-white focus:z-10 focus:ring-4 focus:ring-gray-200">
                    Shop all plants
                </button>
            </form>
        </div>
        <div class="w-1/2 image-box" data-reveal="left">
            <img src="./asset/images/plant/Valentines_Pippa_1x1.jpg" alt="valentines" class="img">
        </div>
    </section>

    <!-- why -->
    <section class="bg-white flex flex-col text-center px-4 py-24 lg:px-16 md:px-8 xl:px-24 xxl:px-40">
        <h1 class="text-5xl font-semibold">Why LeTu?</h1>

        <div class="mt-12 sm:flex items-start justify-between sm:-mx-2">
            <div class="w-full px-4 sm:w-1/3 sm:mx-2 lg:mx-6">
                <div class="h-24">
                    <img src="./asset/images/svg/icon.svg" alt="" class="mx-auto">
                </div>
                <p class="text-md text-gray-700 mt-16">
                    <span class="font-bold">Unbeatable</span>
                    quality We source directly from top-rated growers, so we can sell the finest
                    quality plants at the very best
                    prices.
                </p>
            </div>
            <div class="w-full px-4 sm:w-1/3 sm:mx-2 lg:mx-6">
                <div class="h-24">
                    <img src="./asset/images/svg/icon-1.svg" alt="" class="mx-auto">
                </div>
                <p class="text-md text-gray-700 mt-16">
                    <span class="font-bold">Delivery to your door</span>
                    We’ll bring your plants to your door, anywhere in GB. If you’re not
                    100% happy, tell us within 30
                    days and we’ll sort it.
                </p>
            </div>
            <div class="w-full px-4 sm:w-1/3 sm:mx-2 lg:mx-6">
                <div class="h-24">
                    <img src="./asset/images/svg/icon-2.svg" alt="" class="mx-auto">
                </div>
                <p class="text-md text-gray-700 mt-16">
                    <span class="font-bold">All the help you need</span>
                    We’ll send you a free plant-parenting course and our plant doctors are
                    always on call.
                </p>
            </div>
        </div>
    </section>

    <!-- plant info 2 -->
    <section class="w-screen flex items-center justify-center align-center font-semibold">
        <div class="w-1/2 image-box" data-reveal="left">
            <img src="./asset/images/plant/Jan_23_Decorate-min.jpg" alt="" class="img">
        </div>
        <div class="w-1/2 content-box">
            <h2 class="title" data-reveal="left">Decorate your home with plants</h2>
            <p class="text" data-reveal="left">
                Turn grey months green and bring your home to life with plants. Tiny plants like
                <a href="" class="text-green-700 hover:underline">Suri</a>
                and Wallace can add a pop of
                colour to dark nooks, while Pele, Rob and Zey will happily sit on a coffee table or a counter top.

                For an instant jungle hit, choose a big plant with large, glossy leaves - like
                <a href="" class="text-green-900 hover:underline">Nicolau</a>,
                <a href="" class="text-green-900 hover:underline">Ariel</a> or
                <a href="" class="text-green-900 hover:underline">Robin</a>
                . Shop the look below.
            </p>
        </div>
    </section>

    <!-- plant display -->
    <section class="bg-white py-10 flex items-center justify-center align-center font-semibold">
        <div class="w-2/5 content-box">
            <h1 class="title">Shop the look</h1>
            <p class="text" >We’ve made it easy for you to bring your home to life with plants and pots.</p>
        </div>
        <div id="display-item" class="w-3/5 container relative overflow-hidden">
            <ul id="display-list" class="w-max flex gap-4 relative transition-all ease duration-700">
                <% for (int i = 0; i < 20; i++) {%>
                    <li id="display-li" class="list-none">    
                        <div class="w-max max-w-sm bg-white border border-gray-200 rounded-lg shadow">
                            <a href="#">
                                <img class="p-1 rounded-t-lg" src="./asset/images/plant/see-1.jpg" alt="product image" />
                            </a>
                            <div class="px-5 pb-5">
                                <a href="#">
                                    <h5 class="text-xl font-semibold tracking-tight text-gray-900">
                                        test plant <%= i%>
                                    </h5>
                                </a>
                                <div class="flex items-center mt-2.5 mb-5">
                                    <svg aria-hidden="true" class="w-5 h-5 text-yellow-300" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <title>First star</title>
                                        <path
                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z">
                                        </path>
                                    </svg>
                                    <svg aria-hidden="true" class="w-5 h-5 text-yellow-300" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <title>Second star</title>
                                        <path
                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z">
                                        </path>
                                    </svg>
                                    <svg aria-hidden="true" class="w-5 h-5 text-yellow-300" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <title>Third star</title>
                                        <path
                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z">
                                        </path>
                                    </svg>
                                    <svg aria-hidden="true" class="w-5 h-5 text-yellow-300" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <title>Fourth star</title>
                                        <path
                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z">
                                        </path>
                                    </svg>
                                    <svg aria-hidden="true" class="w-5 h-5 text-yellow-300" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <title>Fifth star</title>
                                        <path
                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z">
                                        </path>
                                    </svg>
                                    <span class="bg-green-100 text-green-800 text-xs font-semibold mr-2 px-2.5 py-0.5 rounded ml-3">5.0</span>
                                </div>
                                <div class="flex items-center justify-between">
                                    <span class="text-3xl font-bold text-gray-900">
                                        $999
                                    </span>
                                    <a href="#" class="text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
                                        Add to cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>  
                <%}%>
            </ul>
            <div id="prev" class="-translate-y-1/2 hover:text-green-700 text-gray-400 text-center no-underline text-4xl border-2 border-gray-300 rounded-lg px-2 transition-all duration-150 ease-in bg-white top-1/2 absolute">
                <i class="fas fa-angle-left"></i>
            </div>
            <div id="next" class=" right-0 -translate-y-1/2 hover:text-green-700 text-gray-400 text-center no-underline text-4xl border-2 border-gray-300 rounded-lg px-2 transition-all duration-150 ease-in bg-white top-1/2 absolute">
                <i class="fas fa-angle-right"></i>
            </div>
        </div>
    </section>

    <script src="./asset/js/ScrollReveal.js"></script>    
    <script src="./asset/js/itemSlider.js"></script>


</div>

