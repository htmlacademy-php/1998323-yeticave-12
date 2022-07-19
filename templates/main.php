<?php require_once ('templates/data.php'); ?>
<main class="container">
    <section class="promo">
        <h2 class="promo__title">Нужен стафф для катки?</h2>
        <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
        <ul class="promo__list">
            <!--заполните этот список из массива категорий-->
            <?php
            foreach ($mas_category as $category):?>
            <li class="promo__item promo__item--boards">
                <a class="promo__link" href="pages/all-lots.html"><?= htmlspecialchars($category) ?></a>
            </li>
            <?php endforeach; ?>
        </ul>
    </section>
    <section class="lots">
        <div class="lots__header">
            <h2>Открытые лоты</h2>
        </div>
        <ul class="lots__list">
            <!--заполните этот список из массива с товарами-->
            <?php
            foreach ($mmas_ad as $product): ?>
            <li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?= htmlspecialchars($product['img_url']) ?>" width="350" height="260" alt="">
                </div>
                <div class="lot__info">
                    <span class="lot__category"><?= htmlspecialchars($product['category']) ?></span>
                    <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?= htmlspecialchars($product['name']) ?></a></h3>
                    <div class="lot__state">
                        <div class="lot__rate">
                            <span class="lot__amount">Стартовая цена: </span>
                            <span class="lot__cost">
                            <?php $productPrice = htmlspecialchars($product['price']); ?>
                            <?=formatPrice($productPrice); ?>
                            </span>
                        </div>
                        <?php $productTime = htmlspecialchars($product['dtime']); ?>
                        <div class="lot__timer timer <?=timeoutClass($productTime);?>" ?>
                            <?=timeout($productTime); ?>
                        </div>
                    </div>
                </div>
            </li>
            <?php endforeach; ?>
        </ul>
    </section>
    
</main>
<?php 
    function formatPrice($productPrice)
    {
        $res = number_format($productPrice, $decimals = 0, $decimal_separator = ".", $thousands_separator = " ") . ' ₽';
        return $res;
    }?>
<?php
    function timeout($productTime)
    {
        $time_min = floor(strtotime($productTime) - time()) % 60;
        $time_hour = floor((strtotime($productTime) - time()) / 3600);
        $result = $time_hour . ' : ' . $time_min;
        return $result;
    }
?>
<?php
    function timeoutClass($productTime)
    {
        $time_hour = floor((strtotime($productTime) - time()) / 3600);
        if ($time_hour === 0)
            {return 'timer--finishing';}
        else
            {return '';}
    }
?>